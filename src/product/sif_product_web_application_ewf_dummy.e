note
	description: "Summary description for {SIF_PRODUCT_WEB_APPLICATION_EWF_DUMMY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_PRODUCT_WEB_APPLICATION_EWF_DUMMY

inherit
	SIF_PRODUCT_WEB_APPLICATION_EWF_WEBSOCKET
		redefine
			initialize
		end

create
	initialize

feature -- Creation

	initialize
			-- Create a dummy web application product so clients have no void safe coding issues
		do
			create scheme.make_empty
			create base_url.make_empty
		end

feature {NONE} -- Manufacturing

	do_create_launcher_and_launch(a_opts: WSF_STANDALONE_WEBSOCKET_SERVICE_OPTIONS)
		local
			l_launcher: WSF_STANDALONE_WEBSOCKET_SERVICE_LAUNCHER [SIF_EWF_WEBSOCKET_EXECUTER_DUMMY]
		do
			create l_launcher.make_and_launch (a_opts)
		end

	manufacture_input_validators
		do
			-- Intended to be empty.
		end

	manufacture_views
			-- Manufacture the views for a user interface through a viewable system interface
		do
		end

	manufacture_commands
		do
		end

end
