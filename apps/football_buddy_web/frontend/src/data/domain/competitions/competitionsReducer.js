import { Map, OrderedSet } from 'immutable'

import {
  LOAD_COMPETITIONS_STARTED,
  LOAD_COMPETITIONS_SUCCESS,
  LOAD_COMPETITIONS_FAILURE,
} from './loadCompetitions/action'

import {
  loadCompetitionsStarted,
  loadCompetitionsSuccess,
  loadCompetitionsFailure,
} from './loadCompetitions/reducer'

const initialState = Map({
  ids: OrderedSet(),
  entities: Map(),
  remoteCall: Map(),
})

const competitionsReducer = (state = initialState, action) => {
  switch (action.type) {
    case LOAD_COMPETITIONS_STARTED:
      return loadCompetitionsStarted(state)
    case LOAD_COMPETITIONS_SUCCESS:
      return loadCompetitionsSuccess(state, action)
    case LOAD_COMPETITIONS_FAILURE:
      return loadCompetitionsFailure(state, action)
    default:
      return state
  }
}

export default competitionsReducer
export { initialState }
