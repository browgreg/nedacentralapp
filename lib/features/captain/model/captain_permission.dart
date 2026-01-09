

enum CaptainPermission {
  manageTeam,
  enterResults,
  viewFixtures,
  useScoring,
}

const captainPermissions = {
  // Later you can split: captain / vice-captain etc
  'CAPTAIN': {
    CaptainPermission.manageTeam,
    CaptainPermission.enterResults,
    CaptainPermission.viewFixtures,
    CaptainPermission.useScoring,
  },
};
