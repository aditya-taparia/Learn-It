class Group {
  final String groupName;

  Group({
    required this.groupName,
  });
}

class Chat {
  final String senderName;
  final DateTime time;
  final String msg;

  Chat({
    required this.senderName,
    required this.time,
    required this.msg,
  });
}
