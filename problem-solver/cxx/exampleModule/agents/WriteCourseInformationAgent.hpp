#pragma once

#include <sc-memory/kpm/sc_agent.hpp>

#include "keynodes/keynodes.hpp"
#include "WriteCourseInformationAgent.generated.hpp"

namespace exampleModule
{
class WriteCourseInformationAgent : public ScAgent
{
  SC_CLASS(Agent, Event(Keynodes::question_write_information, ScEvent::Type::AddOutputEdge))
  SC_GENERATED_BODY()

};

}  // namespace exampleModule
