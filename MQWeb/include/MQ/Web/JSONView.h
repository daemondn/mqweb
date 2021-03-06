/*
 * Copyright 2010 MQWeb - Franky Braem
 *
 * Licensed under the EUPL, Version 1.1 or - as soon they
 * will be approved by the European Commission - subsequent
 * versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the
 * Licence.
 * You may obtain a copy of the Licence at:
 *
 * http://joinup.ec.europa.eu/software/page/eupl
 *
 * Unless required by applicable law or agreed to in
 * writing, software distributed under the Licence is
 * distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied.
 * See the Licence for the specific language governing
 * permissions and limitations under the Licence.
 */

#ifndef _MQWeb_JSONView_H
#define _MQWeb_JSONView_H

#include "Poco/Net/HTTPServerResponse.h"
#include "MQ/Web/View.h"

namespace MQ {
namespace Web {

class JSONView : public View
	/// A view that renders a JSON object
{
public:
	JSONView();
		/// Constructor

	virtual ~JSONView();
		/// Destructor

	void initializeResponse(Poco::Net::HTTPServerResponse& response);

	bool render(Poco::JSON::Object::Ptr data, std::ostream& os);
		/// Renders the JSON object
};

} } // Namespace MQ::Web

#endif //_MQWeb_JSONView_H
