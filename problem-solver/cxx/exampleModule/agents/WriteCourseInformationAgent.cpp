#include <iostream>

#include <sc-memory/sc_memory.hpp>
#include <sc-memory/sc_stream.hpp>

#include "WriteCourseInformationAgent.hpp"

using namespace std;
using namespace utils;

namespace exampleModule
{
SC_AGENT_IMPLEMENTATION(WriteCourseInformationAgent)
  {
    SC_LOG_DEBUG("WriteCourseInformationAgent: started");
    SC_LOG_WARNING("STOP");
    ScAddr actionNode = otherAddr;
    SC_LOG_DEBUG("WriteCourseInformationAgent: finished");
    return
    SC_RESULT_OK;
  }

}  // namespace exampleModule
