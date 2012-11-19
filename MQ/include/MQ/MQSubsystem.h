/*
 * Copyright 2010 MQWeb - Franky Braem
 *
 * Licensed under the EUPL, Version 1.1 or  as soon they
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
#ifndef _MQ_MQSubsystem_h
#define _MQ_MQSubsystem_h

#include <Poco/Util/Subsystem.h>
#include <MQ/MQFunctions.h>

namespace MQ
{
  
  class MQSubsystem : public Poco::Util::Subsystem
  {
  public:

    enum ConnectionMode
    {
        BINDING_MODE
      , CLIENT_MODE
    };

    MQSubsystem();
    
    
    virtual ~MQSubsystem();
    
    
    virtual const char * name() const;
    
    
    virtual void initialize(Poco::Util::Application& app);
    
    
    virtual void uninitialize();


    bool binding() const;


    bool client() const;


    MQFunctions& functions();


    ConnectionMode mode() const;


    void load();


  private:
    MQFunctions _functions;

    ConnectionMode _connectionMode;
  };


  inline const char * MQSubsystem::name() const
  {
    return "MQ";
  }


  inline MQFunctions& MQSubsystem::functions()
  {
    return _functions;
  }


  inline bool MQSubsystem::binding() const
  {
    return _connectionMode == BINDING_MODE;
  }


  inline bool MQSubsystem::client() const
  {
    return _connectionMode == CLIENT_MODE;
  }


  inline MQSubsystem::ConnectionMode MQSubsystem::mode() const
  {
    return _connectionMode;
  }

} // Namespace MQ

#endif // _MQ_MQSubsystem_h
