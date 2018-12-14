note
	description: "Summary description for {SIF_SI_USER_VIEWABLE_WEB_APPLICATION_EWF_WEBSOCKET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_SI_USER_VIEWABLE_WEB_APPLICATION_EWF_WEBSOCKET

inherit
	SIF_SI_USER_VIEWABLE_WEB_APPLICATION

create
	make_with_layer

feature -- Identification

	id : INTEGER
			-- Return the correct system interface identifier as defined in SIF_SYSTEM_INTERFACE_IDENTIFIERS
		do
			Result := Sii_web_application_interface_based_on_Eiffel_Web_Framework_and_websocket
		end

end
