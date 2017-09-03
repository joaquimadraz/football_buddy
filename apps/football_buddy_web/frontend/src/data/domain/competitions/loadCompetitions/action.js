import api from 'utils/api'

const LOAD_COMPETITIONS_STARTED = 'LOAD_COMPETITIONS_STARTED'
const LOAD_COMPETITIONS_SUCCESS = 'LOAD_COMPETITIONS_SUCCESS'
const LOAD_COMPETITIONS_FAILURE = 'LOAD_COMPETITIONS_FAILURE'

function handleLoadStarted(dispatch) {
  dispatch({ type: LOAD_COMPETITIONS_STARTED })
}

function handleLoadSuccess(dispatch, response) {
  const { data, meta } = response.data

  dispatch({ type: LOAD_COMPETITIONS_SUCCESS, data, meta })
}

function handleLoadFailure(dispatch, error) {
  dispatch({ type: LOAD_COMPETITIONS_FAILURE, error })
}

const loadCompetitions = (params = {}) =>
  (dispatch) => {
    handleLoadStarted(dispatch)

    api.getCompetitions(params)
      .then(response => handleLoadSuccess(dispatch, response))
      .catch(error => handleLoadFailure(dispatch, error))
  }

export default loadCompetitions

export {
  LOAD_COMPETITIONS_STARTED,
  LOAD_COMPETITIONS_SUCCESS,
  LOAD_COMPETITIONS_FAILURE,
}
