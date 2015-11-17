require "bundler/setup"
require "rubygems"
require "cloudmunch_sdk"
require "date"

class JsonReadPluginApp < AppAbstract

    def initializeApp()
        json_input = getJSONArgs()

	   @json_read = json_input['json_file_read']
        @log_level = json_input['log_level'] 

        appContext = getAppContext(json_input)
        @domain = appContext.get_data('domain')
        @project = appContext.get_data('project')
        
        logInit(@log_level)
        log("info", "initializeApp is invoked in json_read_plugin App")     
    end

    def process()
        log("info", "process is invoked in json_read_plugin App")
        savejsonfile(@json_file_read.to_json)
    end  

    def savejsonfile(message)
        log("info", "savejsonfile is invoked in json_read_plugin App")
        log("debug", message)
        # the result_array needs to be stored into CMDB
        # updateCustomContext()
        @id = "messageid"
        log("info", "Updating cmdb with exceldata: id:"+@id) 

        data_pack = {
            "domain" => @domain,
            "project" => @project,
            "context" => @json_read,
            "id" => @id,
            "data" => message
        }
        #pass the filled in hash object to the following method
        updateDataContextToCMDB(data_pack)  
    end 

    def cleanupApp()
        log("info", "cleanupApp is invoked in json_read_plugin App")
        logClose()
    end


end

json_read_plugin = json_read_pluginApp.new()
json_read_plugin.start()
