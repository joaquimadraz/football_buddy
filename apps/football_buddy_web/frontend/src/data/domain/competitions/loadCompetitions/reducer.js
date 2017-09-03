import { Map, OrderedSet } from 'immutable'
import { parseCompetition } from 'data/domain/Competition'

const resetState = state => (
  state.set('ids', OrderedSet())
       .set('entities', Map())
       .setIn(['remoteCall', 'loading'], false)
       .setIn(['remoteCall', 'error'], null)
)

const loadCompetitionsStarted = (state) => (
  resetState(state).setIn(['remoteCall', 'loading'], true)
)

const loadCompetitionsSuccess = (state, { data }) => {
  return data.reduce((newState, competition) => {
    return newState.update('ids', value => value.add(competition.code))
                   .setIn(['entities', competition.code], parseCompetition(competition))
  }, resetState(state))
}

const loadCompetitionsFailure = (state, { error }) => {
  const response = error.response

  return state.setIn(['remoteCall', 'loading'], false)
              .setIn(['remoteCall', 'error'], response)
}

export {
  loadCompetitionsStarted,
  loadCompetitionsSuccess,
  loadCompetitionsFailure,
}
