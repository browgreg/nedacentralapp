class AppRoutes {
  // ─────────────────────────
  // PUBLIC
  // ─────────────────────────
  static const landing = '/landing';
  static const honours = '/honours';
  static const fixtures = '/fixtures';
  static const results = '/results';

  // ─────────────────────────
  // AUTH / HUBS (future)
  // ─────────────────────────
  static const playerHub = '/player';
  static const playerTeams = '/playerTeams';
  static const playerStats = '/playerStats';
  static const playerScoring = '/playerScoring';
  static const committeeHub = '/committee';
  static const captainHub = '/captain';
  static const captainTeams = '/captainTeams';
  static const captainResults = '/captainResults';
  static const captainScoring = '/captainScoring';
  static const competitionHub = '/competition';
  static const competitionBrackets = '/competitionBrackets';
  static const competitionRegistration = '/competitionRegistration';
  static const competitionPublish = '/competitionPublish';

  // ─────────────────────────
  // ADMIN ROOT
  // ─────────────────────────
  static const admin = '/admin';

  // ─────────────────────────
  // ADMIN → HONOURS
  // ─────────────────────────
  static const adminPresidents = '/admin/presidents';
  static const adminLifeMembers = '/admin/lifeMembers';
  static const adminSinglesChampions = '/admin/singlesChampions';
  static const adminDoublesChampions = '/admin/doublesChampions';
  static const adminTeamsChampions = '/admin/teamsChampions';
  static const adminOneSeventyClub = '/admin/oneSeventyClub';

  // ─────────────────────────
  // ADMIN → COMMITTEE
  // ─────────────────────────
  static const adminCommittee = '/admin/committee';
  static const adminCommitteeMembers = '/admin/committeeMembers';
  static const adminCommitteeDocuments = '/admin/committeeDocuments';
  static const adminVicePresident = '/admin/committee/vicePresident';
  static const adminSecretary = '/admin/committee/secretary';
  static const adminTreasurer = '/admin/committee/treasurer';
  static const adminMatchSecretary = '/admin/committee/matchSecretary';
  static const adminPublicOfficer = '/admin/committee/publicOfficer';
  static const adminGeneralCommittee = '/admin/committee/general';
  static const adminFundraising = '/admin/committee/fundraising';

  // ─────────────────────────
  // ADMIN → LEAGUE
  // ─────────────────────────
  static const adminLeagues = '/admin/leagues';
  static const adminLadders = '/admin/ladders';
  static const adminLeagueLadders = '/admin/league/ladders';
  static const adminLeagueFixtures = '/admin/league/fixtures';
  static const adminLeagueResults = '/admin/league/results';
  static const adminTeamBuilder = '/admin/league/teamBuilder';
  static const adminVenueBuilder = '/admin/league/venueBuilder';

  // ─────────────────────────
  // ADMIN → COMPETITION
  // ─────────────────────────
  static const adminCompetitions = '/admin/competitions';
  static const adminCompetitionBrackets = '/admin/competitions/brackets';
  static const adminCompetitionPublish = '/admin/competitions/publish';
  static const adminCompetitionRegistration =
      '/admin/competitions/registration';

  // ─────────────────────────
  // ADMIN → IT / METRICS
  // ─────────────────────────
  static const adminMetrics = '/admin/metrics';
  static const adminUsers = '/admin/users';
  static const adminFiles = '/admin/files';
  static const adminEmails = '/admin/emails';
  static const adminDomains = '/admin/domains';
  static const adminDatabases = '/admin/databases';

  // ─────────────────────────
  // ADMIN → SCORING
  // ─────────────────────────
  static const adminScoring = '/admin/scoring';
}
