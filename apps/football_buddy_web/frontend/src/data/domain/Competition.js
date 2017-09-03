import { Record } from 'immutable'

const competitionObject = {
  code: null,
  name: null,
  year: null,
  matchdaysCount: null,
  teamsCount: false,
}

const CompetitionRecord = Record(competitionObject)

class Competition extends CompetitionRecord {
  // Extend immutable js Record
}

export function parseCompetition(object) {
  return new Competition({
    code: object.code,
    name: object.name,
    year: object.yeat,
    matchdaysCount: object.matchdays_Count,
    teamsCount: object.teams_count,
  })
}

export default Competition
