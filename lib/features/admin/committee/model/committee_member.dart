class CommitteeMember {
  final int rego;
  final String name;

  const CommitteeMember({
    required this.rego,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'rego': rego,
        'name': name,
      };
}
