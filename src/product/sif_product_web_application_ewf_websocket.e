note
	description: "Summary description for {SIF_PRODUCT_WEB_APPLICATION_EWF_WEBSOCKET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SIF_PRODUCT_WEB_APPLICATION_EWF_WEBSOCKET

inherit
	SIF_PRODUCT_WEB_APPLICATION
		redefine
			launch
		end

	SIF_SHARED_PRODUCT_WEB_APPLICATION_EWF

feature {NONE} -- Manufacturing

	launch
			-- Launch the product for publicity
		local
			opts: WSF_STANDALONE_WEBSOCKET_SERVICE_OPTIONS
		do
			if is_initialized then

				put_the_product (Current)							-- Make sure that the one and only initialized sif web application product is shared correctly.

				create opts
				opts.set_is_verbose (true)
				opts.set_option ("verbose_level", "INFORMATION")
				opts.set_option ("port", port)
				opts.set_option ("max_concurrent_connections", 100)
				opts.set_option ("keep_alive_timeout", 2)
				opts.set_option ("max_tcp_clients", 100)
				opts.set_option ("socket_timeout", 30)
				opts.set_option ("socket_recv_timeout", 5)
				opts.set_option ("max_keep_alive_requests", -1)

				do_create_launcher_and_launch(opts)
			end
		end

feature {NONE} -- Manufacturing

	do_create_launcher_and_launch(a_opts: WSF_STANDALONE_WEBSOCKET_SERVICE_OPTIONS)
		deferred
		end

	manufacture_system_interfaces
		do
			-- While the system interface in the case of a web application based on web socket
			-- is a communication based on the web socket and due to the concurrent nature of
			-- these kind of communications (mostly there are concurrent socket connections for
			-- each web application session) there is not ONE instance of a system interface in
			-- the runtime system. The system interface will be instantiated for each socket connection.

			-- Intended to be empty
		end

feature -- System interface

	create_system_interface(a_layer_application_sif: LAYER_APPLICATION_SIF): SIF_SI_USER_VIEWABLE_WEB_APPLICATION
			-- Create an instance of a user viewable system interface
		do
			Result := create {SIF_SI_USER_VIEWABLE_WEB_APPLICATION_EWF_WEBSOCKET}.make_with_layer(a_layer_application_sif)
		end

end
