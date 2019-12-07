module GeocoderStub
  def self.stub_with(facility)
    Geocoder.configure(lookup: :test)

    results = [
        {
            'latitude'  => Faker::Address.latitude.first(9),
            'longitude' => Faker::Address.longitude.first(9)
        }
    ]

    queries = [facility.full_address, facility.zip]
    queries.each { |q| Geocoder::Lookup::Test.add_stub(q, results) }
  end
end