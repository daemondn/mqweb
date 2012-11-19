/*
 * Copyright 2010 MQCheck - Franky Braem
 *
 * Licensed under the EUPL, Version 1.1 or – as soon they
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

#ifndef _MQCheck_Application_H
#define _MQCheck_Application_H

#include <Poco/Util/Application.h>
#include <Poco/Util/Option.h>
#include <Poco/Util/OptionSet.h>
#include <Poco/Util/HelpFormatter.h>

#include <MQ/QueueManager.h>
#include <MQ/Queue.h>
#include <MQ/CommandServer.h>

class MQCheckApplication : public Poco::Util::Application
{
public:
  MQCheckApplication();

  ~MQCheckApplication();

protected:

  void initialize(Application& self);
  

  void uninitialize();


  void defineOptions(Poco::Util::OptionSet& options);


  void handleOption(const std::string& name, const std::string& value);


  void displayHelp();


  int main(const std::vector<std::string>& args);


private:
  bool _helpRequested;

  void checkQueues(MQ::QueueManager::Ptr qmgr, MQ::CommandServer& cmdServer);
  void checkChannelStatus(MQ::QueueManager::Ptr qmgr, MQ::CommandServer& cmdServer);

};

#endif //  _MQCheck_Application_H
