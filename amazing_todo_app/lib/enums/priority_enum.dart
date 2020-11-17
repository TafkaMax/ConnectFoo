enum PriorityEnum { VeryRelaxed, Relaxed, NotUrgent, Urgent, VeryUrgent }

String priorityString(PriorityEnum priorityEnum) {
  switch (priorityEnum) {
    case PriorityEnum.VeryRelaxed:
      return "Very Relaxed";
    case PriorityEnum.Relaxed:
      return "Relaxed";
    case PriorityEnum.NotUrgent:
      return "Not urgent";
    case PriorityEnum.Urgent:
      return "Urgent";
    case PriorityEnum.VeryUrgent:
      return "Very urgent";
    default:
      return "Not Urgent";
  }
}

PriorityEnum priorityEnumFromString(String priorityEnumString) {
  switch (priorityEnumString) {
    case "Very Relaxed":
      return PriorityEnum.VeryRelaxed;
    case "Relaxed":
      return PriorityEnum.Relaxed;
    case "Not Urgent":
      return PriorityEnum.NotUrgent;
    case "Urgent":
      return PriorityEnum.Urgent;
    case "Very Urgent":
      return PriorityEnum.VeryUrgent;
    default:
      return PriorityEnum.NotUrgent;
  }
}
