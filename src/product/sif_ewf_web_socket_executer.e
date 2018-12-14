note
	description: "Summary description for {SIF_EWF_WEB_SOCKET_EXECUTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SIF_EWF_WEBSOCKET_EXECUTER

inherit
	HTTP_MIME_TYPES

	WSF_WEBSOCKET_EXECUTION

	SIF_SHARED_PRODUCT_WEB_APPLICATION_EWF

feature -- Websocket execution

	new_websocket_handler (ws: WEB_SOCKET): WEB_SOCKET_HANDLER
		local
			l_communication_layer_session_websocket: LAYER_SESSION_WEBSOCKET
			l_communication_layer_application_sif: LAYER_APPLICATION_SIF
		do
			create l_communication_layer_session_websocket.make (create {ENUMERATION_WEBSOCKET_MODE}.make({ENUMERATION_WEBSOCKET_MODE}.server), ws)
			create l_communication_layer_application_sif.make (internal_product.item)
			l_communication_layer_application_sif.put_system_interface(internal_product.item.create_system_interface(l_communication_layer_application_sif))
			l_communication_layer_application_sif.set_lower_layer(l_communication_layer_session_websocket)
			l_communication_layer_session_websocket.set_higher_layer (l_communication_layer_application_sif)

			create Result.make (ws, l_communication_layer_session_websocket)
			Result.web_socket.set_is_verbose (true)
		end

end
