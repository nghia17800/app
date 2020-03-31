module Fog
  module DNS
    class Dnsimple
      class Real
        # Get the list of ALL domains in the account.
        #
        # This method is similar to #list_domains, but instead of returning the results
        # of a specific page it iterates all the pages and returns the entire collection.
        #
        # Please use this method carefully, as fetching the entire collection will increase
        # the number of requests you send to the API server and you may eventually be rate-limited.
        #
        # @see https://developer.dnsimple.com/v2/domains/#list
        # @see https://github.com/dnsimple/dnsimple-developer/tree/master/fixtures/v2/listDomains
        #
        # @param  query [Hash]
        # @return [Excon::Response]
        def list_all_domains(query: {})
          paginate(query: query) do |current_query|
            list_domains(query: current_query)
          end
        end
      end

      class Mock
        def list_all_domains(_query: {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
              "data" => self.data[:domains],
              "pagination" => { "current_page" => nil, "per_page" => nil, "total_entries" => 60, "total_pages" => 2 }
          }
          response
        end
      end
    end
  end
end
