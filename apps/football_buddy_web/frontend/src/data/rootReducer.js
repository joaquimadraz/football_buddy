import { combineReducers } from 'redux'
import { routerReducer } from 'react-router-redux'
import competitionsReducer from 'data/domain/competitions/competitionsReducer'

const rootReducer = combineReducers({
  routing: routerReducer,
  competitions: competitionsReducer,
})

export default rootReducer
