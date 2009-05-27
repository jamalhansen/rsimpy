module RSimpy
  class BaseService
    attr_reader :success, :status_message, :status_code

    def reset
      @success = false
      @status_message = nil
      @status_code = nil
    end

    def set_status response
      @success = ((response.code == 200) && response['status']['code'] == "0")
      if response.code == 200
        @status_code = response['status']['code']
        @status_message = response['status']['message']
      end
    end

    def execute_using method, params
      reset

      response = @client.execute method, build_link(params)
      set_status response

      response
    end
  end
end
