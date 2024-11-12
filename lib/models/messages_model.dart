class MsessagesModels {
  final String? messages;
  final String id;
  MsessagesModels(this.messages, this.id);
  factory MsessagesModels.fromJson(jsonData) {
    return MsessagesModels(jsonData['messages'], jsonData['id']);
  }
}
