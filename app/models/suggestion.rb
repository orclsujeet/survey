class Suggestion < ActiveRecord::Base
	after_commit :survey_sms, on: :create

	# Sends sms to user when survey is created. 
    def survey_sms
    	require 'net/http'
        phone_number=self.mobile
        name=self.name
        msg="Thanks you #{name} for your valuable feedback. Mr. Parvesh Kumar has noted down it and it will be added in our manifesto. we will come back to you."
        url = URI("http://api.msg91.com/api/sendhttp.php?"+"authkey=" + "207754AbdryBLzqQD5ac5e974" + "&mobiles=" + phone_number+ "&message=" + msg + "&sender=" + "FRCLUE" + "&route="+"4" +"&country="+"0" )
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Get.new(url)
        response = http.request(request)
        puts response.read_body
    end  
end
