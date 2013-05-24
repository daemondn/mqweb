/*
 * Copyright 2010 MQWeb - Franky Braem
 *
 * Licensed under the EUPL, Version 1.1 or � as soon they
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
#include <Poco/JSON/TemplateCache.h>

#include <MQ/Web/MultiView.h>

namespace MQ {
namespace Web {

MultiView::MultiView(const std::string &templateFile) :
	TemplateView(templateFile)
{
}


MultiView::~MultiView()
{
}


bool MultiView::render(Poco::JSON::Object::Ptr data, std::ostream& os)
{
	Poco::JSON::Object::Ptr jsonMQWeb = data->getObject("mqweb");
	poco_check_ptr(jsonMQWeb);

	Poco::JSON::Object::Ptr jsonViews = jsonMQWeb->getObject("views");
	if ( jsonViews.isNull() )
	{
		jsonViews = new Poco::JSON::Object();
		jsonMQWeb->set("views", jsonViews);
	}

	for(ViewMap::iterator it = _views.begin(); it != _views.end(); ++it)
	{
		std::ostringstream oss;
		if ( it->second->render(data, oss) )
		{
			jsonViews->set(it->first, oss.str());
		}
		else
		{
			return false;
		}
	}

	return TemplateView::render(data, os);
}


}} // Namespace MQ::Web