class StructuredEventSerializer
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def to_json
    {
      "@context": "http://schema.org",
      "@type": "Event",
      "name": "#{event['name']['text']}",
      "startDate": "#{event['start']['local']}",
      "location": {
        "@type": "Place",
        "name": "#{event['venue']['name']}",
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "#{event['venue']['address']['address_1']}",
          "addressLocality": "#{event['venue']['address']['city']}",
          "postalCode": "#{event['venue']['address']['postal_code']}",
          "addressRegion": "#{event['venue']['address']['region']}",
          "addressCountry": "#{event['venue']['address']['country']}"
        }
      },
      "image": [
        "#{event['logo']['original']['url']}"
       ],
      "description": "#{event['description']['text'].first(200)}",
      "performer": {
        "@type": "PerformingGroup",
        "name": "Turing School"
      }
    }.to_json
  end
end
