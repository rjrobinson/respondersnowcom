# frozen_string_literal: true

require "selenium-webdriver"
require "chromedriver-helper"


class HospitalStatusJob < ApplicationJob
  queue_as :default

  NJ_URL = "https://hippocrates.nj.gov/hospdivert/viewCurrentHospitalStatusEMSDivert.action?stateId=318&fromLogin=N"
  FIELDS_TITLES = %w(state county facility status reason startTime expire_time)


  def perform(*args)
    array_hospitals = []
    options = Selenium::WebDriver::Chrome::Options.new


    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options

    driver.navigate.to NJ_URL
    driver.navigate.refresh

    hospitals = driver.find_elements(:css, ".tabledata")

    hospitals.each do |hospital|
      hash_hospital = {}
      fields = hospital.find_elements(:css, "td")

      fields.each_with_index do |field, index|
        hash_hospital.merge!(FIELDS_TITLES[index] => field.text)
      end
      array_hospitals << hash_hospital
    end

    array_hospitals.each do |data|
      h = Hospital.find_by(name: data["facility"])

      if h&.last_status_expired?
        h.hospital_statuses.create(
          county: data["county"],
          status: data["status"],
          start_time: Chronic.parse(data["startTime"]),
          expire_time: Chronic.parse(data["expire_time"]),
          reason: data["reason"]
        )
      end

      # GUARD
      # IF There are no status updates,
      # and this would be the first iteration, then just make it the first time
      if h.hospital_statuses.empty?
        h.hospital_statuses.create(
          county: data["county"],
          status: data["status"],
          start_time: Chronic.parse(data["startTime"]),
          expire_time: Chronic.parse(data["expire_time"]),
          reason: data["reason"]
        )

      end
    end


  ensure
    driver.quit
  end
end
