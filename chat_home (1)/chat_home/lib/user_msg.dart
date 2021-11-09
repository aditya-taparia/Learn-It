class User {
  final int id;
  final String name;
  final String imageUrl;

  User({
    required this.id ,
    required this.name,
    required this.imageUrl,
  });
}
class Message {
  final User sender;
  final String
  time;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

final User SoftwareEngineering = User(
  id: 1,
  name: 'Software Engineering',
  imageUrl: 'assets/images/greg.jpg',
);
final User ArtificialIntelligence = User(
  id: 2,
  name: 'Artificial Intelligence',
  imageUrl: 'assets/images/greg.jpg',
);
final User SoftComputing = User(
  id: 3,
  name: 'Soft Computing',
  imageUrl: 'assets/images/greg.jpg',
);
final User ComputerForensics = User(
  id: 4,
  name: 'Computer Forensics',
  imageUrl: 'assets/images/greg.jpg',
);
final User SignalProcessing = User(
  id: 5,
  name: 'Signal Processing',
  imageUrl: 'assets/images/greg.jpg',
);
final User IHS1 = User(
  id: 6,
  name: 'IHS1',
  imageUrl: 'assets/images/greg.jpg',
);
final User IHS2 = User(
  id: 7,
  name: 'IHS2',
  imageUrl: 'assets/images/greg.jpg',
);

List<Message> chats = [
  Message(
    sender: ArtificialIntelligence,
    time: ' 17:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: true,
  ),
  Message(
    sender: ComputerForensics,
    time: ' 16:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: true,
  ),
  Message(
    sender: SoftComputing,
    time: ' 15:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: false,
  ),
  Message(
    sender: IHS1,
    time: ' 14:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: true,
  ),
  Message(
    sender: IHS2,
    time: ' 13:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: false,
  ),
  Message(
    sender: SignalProcessing,
    time: ' 12:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: false,
  ),
  Message(
    sender: SoftwareEngineering,
    time: ' 11:30',
    text: 'Complete the given assignment last date is 4th November',
    unread: false,
  ),
];

