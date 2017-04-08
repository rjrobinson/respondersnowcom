require 'http'
require 'nokogiri'
require 'active_support'
require 'active_support/core_ext'
require 'json'
require 'pry'
require 'rest-client'
class Course
  attr_accessor :name, :description, :classes

  # def initialize(args)
  #   @name = args[:name]
  #   @description = args[:description]
  #   @classes = []
  # end


end

class NJClass
  attr_accessor :name, :code, :dates, :location, :schedule, :classes

  # def initialize(args)
  #   @name = args[:name]
  #   @code = args[:code]
  #   @dates = args[:dates]
  #   @location = args[:location]
  #   @schedule = args[:schedule]
  #   @classes = []
  # end

end

class ClassDateTime
  attr_accessor :date, :time, :details, :location, :classroom, :instructor
end

#Get categories of classes

def get_categories
  begin
    doc = Nokogiri::HTML(RestClient.get('http://www.njoemscert.com/CourseCatalog/index.cfm?fuseaction=browse').to_s)
  rescue
    puts "error"
  end
  categories = doc.xpath('//a').select { |link| link['href'] =~ /index\.cfm\?fuseaction=browse&CategoryID=\d+/i } if doc

  categories
end


#Get courses links from each category and make sure no duplicates
courses = []
course_names = []

categories = get_categories
categories.each do |category|
  begin
    doc = Nokogiri::HTML(RestClient.get('http://www.njoemscert.com/CourseCatalog/'+category['href']).to_s)
    current_courses = doc.xpath('//a').select { |link| link['href'] =~ /\.\.\/training\/classscheduler\/index\.cfm\?Fuseaction=Home\.CourseDetails&intCSCourseID=\d+&AddPopularity=1/i }

    #Check if already got class URL
    current_courses.each do |course|
      unless course_names.include? course.text
        course_names << course.text
        courses << course
      end
    end
  rescue
    puts 'error'
  end

end

puts "Num courses: #{courses.length}"
#
# #Get classes info page and course info page for each course
# classes_info = []
# courses_info = []
# p 'starting course cycle . . .'
# courses.each do |course|
#   begin
#     ci = Nokogiri::HTML(RestClient.get('http://www.njoemscert.com/CourseCatalog/'+course['href']).to_s)
#     courses_info << ci
#     class_links = ci.xpath('//a').select { |link| link.text == 'View Class Summary' }
#     class_links.each do |link|
#       begin
#         doc = Nokogiri::HTML(RestClient.get('http://www.njoemscert.com/'+link['href'][22..-1]).to_s)
#         classes_info << doc
#       rescue
#         puts 'error in links'
#       end
#     end
#   rescue
#     puts 'error in courses'
#   end
# end
#
#
# #Search for course name and description
# course = []
# courses_info.each do |class_courseq|
#   crs = Course.new(name: class_course.text.strip)
#
#   course_trs = class_course.xpath('//tr')
#   #Get course description from course info page
#   course_trs.each do |cTr|
#     c = cTr.children.select { |c| c.name != 'text' }
#     if c.length == 2
#       cC = c[0].children.select { |c| c.name != 'text' }
#       if cC.length == 1
#         if cC[0].text == 'Course Description:'
#           course[i].description = c[1].text.strip
#         end
#       end
#     end
#   end
#
#   #Search for classes details
#   course.classes = []
#
#   puts "Classes: #{+classes_info[i].length}"
#
#   classes_info.each do |course|
#     nk_class = NJClass.new
#     classTrs = classes_info[i][j].xpath('//tr')
#     for cTr in classTrs
#       c = cTr.children.select { |c| c.name != 'text' }
#       if c.length == 2
#         cC = c[0].children.select { |c| c.name != 'text' }
#         if cC.length == 1
#           if cC[0].text == 'Class:'
#             course[i].classes[j].name = c[1].text.strip
#           elsif cC[0].text == 'Class Code:'
#             course[i].classes[j].code = c[1].text.match(/\d+/i).to_s.strip
#           elsif cC[0].text == 'Class Dates:'
#             course[i].classes[j].dates = c[1].text.strip
#           elsif cC[0].text == 'Classroom (Location):'
#             course[i].classes[j].location = c[1].text.strip
#           end
#         end
#       end
#     end
#
#
#     #Get tables containing class schedule
#     course[i].classes[j].schedule = ClassDateTime.new
#     courseTables = courses_info[i].xpath('//table').select { |c| c.name!='text' }
#     classTables = []
#     for y in 0..(courseTables.length-1)
#       trs = courseTables[y].xpath('tr').select { |c| c.name!='text' }
#       if trs.length != 0
#         tds = trs[0].xpath('td').select { |c| c.name != 'text' }
#         if tds.length != 0
#           b = tds[0].xpath('b').select { |c| c.name != 'text' }
#         end
#         if b.length != 0
#           if b[0].text == 'Class Details'
#             classTables << courseTables[y]
#           end
#         end
#       end
#     end
#
#
#     #Find the correct schedule table and get the info from it
#     for tBody in classTables
#       course_trs = tBody.xpath('tr').select { |c| c.name != 'text' }
#       for cTr in course_trs
#         c = cTr.children.select { |c| c.name != 'text' }
#         if c.length == 2
#           cC = c[0].children.select { |c| c.name != 'text' }
#           if cC.length == 1
#             if cC[0].text == 'Class Code:'
#               if c[0].text.match(/\d+/).to_s.to_i == course[i].classes[j].code.to_s.to_i
#                 scheduleTrs = tBody.xpath('tr/td/table/tr').select { |c| c.name != 'text' }
#                 details = scheduleTrs[1].xpath('td').select { |c| c.name != 'text' }
#                 course[i].classes[j].schedule.date = details[0].text.strip
#                 course[i].classes[j].schedule.time = details[1].text.strip
#                 course[i].classes[j].schedule.details = details[2].text.strip
#                 course[i].classes[j].schedule.location = details[3].text.strip
#                 course[i].classes[j].schedule.classroom = details[4].text.strip
#                 course[i].classes[j].schedule.instructor = details[5].text.strip
#                 break
#               end
#             end
#           end
#         end
#       end
#     end
#
#   end
# end

# puts ActiveSupport::JSON.encode(course)

###############################


puts('Num courses: '+courses.length.to_s)

#Get classes info page and course info page for each course
classesInfo = Array.new(courses.length)
coursesInfo = Array.new(courses.length)
for i in 0..(courses.length-1)
  coursesInfo[i] = Nokogiri::HTML(RestClient.get('http://www.njoemscert.com/CourseCatalog/'+courses[i]['href']).to_s)
  classesInfo[i] = Array.new
  classLinks = coursesInfo[i].xpath('//a').select { |link| link.text == 'View Class Summary' }
  for classLink in classLinks
    doc = Nokogiri::HTML(RestClient.get('http://www.njoemscert.com/'+classLink['href'][22..-1]).to_s)
    classesInfo[i] << doc
  end
end

#Search for course name and description
course = Array.new(coursesInfo.length)
for i in 0..(coursesInfo.length-1)
  course[i] = Course.new
  course[i].name = courseNames[i].strip
  courseTrs = coursesInfo[i].xpath('//tr')

  #Get course description from course info page
  for cTr in courseTrs
    c = cTr.children.select { |c| c.name != 'text' }
    if c.length == 2
      cC = c[0].children.select { |c| c.name != 'text' }
      if cC.length == 1
        if cC[0].text == 'Course Description:'
          course[i].description = c[1].text.strip
        end
      end
    end
  end

  #Search for classes details
  course[i].classes = Array.new(classesInfo[i].length)
  puts('Classes: '+classesInfo[i].length.to_s)
  for j in 0..(classesInfo[i].length-1)
    course[i].classes[j] = Class.new
    classTrs = classesInfo[i][j].xpath('//tr')
    for cTr in classTrs
      c = cTr.children.select { |c| c.name != 'text' }
      if c.length == 2
        cC = c[0].children.select { |c| c.name != 'text' }
        if cC.length == 1
          if cC[0].text == 'Class:'
            course[i].classes[j].name = c[1].text.strip
          elsif cC[0].text == 'Class Code:'
            course[i].classes[j].code = c[1].text.match(/\d+/i).to_s.strip
          elsif cC[0].text == 'Class Dates:'
            course[i].classes[j].dates = c[1].text.strip
          elsif cC[0].text == 'Classroom (Location):'
            course[i].classes[j].location = c[1].text.strip
          end
        end
      end
    end


    #Get tables containing class schedule
    course[i].classes[j].schedule = ClassDateTime.new
    courseTables = coursesInfo[i].xpath('//table').select { |c| c.name!='text' }
    classTables = Array.new
    for y in 0..(courseTables.length-1)
      trs = courseTables[y].xpath('tr').select { |c| c.name!='text' }
      if trs.length != 0
        tds = trs[0].xpath('td').select { |c| c.name != 'text' }
        if tds.length != 0
          b = tds[0].xpath('b').select { |c| c.name != 'text' }
        end
        if b.length != 0
          if b[0].text == 'Class Details'
            classTables << courseTables[y]
          end
        end
      end
    end


    #Find the correct schedule table and get the info from it
    for tBody in classTables
      courseTrs = tBody.xpath('tr').select { |c| c.name != 'text' }
      for cTr in courseTrs
        c = cTr.children.select { |c| c.name != 'text' }
        if c.length == 2
          cC = c[0].children.select { |c| c.name != 'text' }
          if cC.length == 1
            if cC[0].text == 'Class Code:'
              if c[0].text.match(/\d+/).to_s.to_i == course[i].classes[j].code.to_s.to_i
                scheduleTrs = tBody.xpath('tr/td/table/tr').select { |c| c.name != 'text' }
                details = scheduleTrs[1].xpath('td').select { |c| c.name != 'text' }
                course[i].classes[j].schedule.date = details[0].text.strip
                course[i].classes[j].schedule.time = details[1].text.strip
                course[i].classes[j].schedule.details = details[2].text.strip
                course[i].classes[j].schedule.location = details[3].text.strip
                course[i].classes[j].schedule.classroom = details[4].text.strip
                course[i].classes[j].schedule.instructor = details[5].text.strip
                break
              end
            end
          end
        end
      end
    end

  end

end

puts ActiveSupport::JSON.encode(course)


