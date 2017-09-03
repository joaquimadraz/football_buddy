import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { Iterable, Map } from 'immutable'
import { connect } from 'react-redux'
import loadCompetitions from 'data/domain/competitions/loadCompetitions/action'
import Home from './components/Home'

class HomeContainer extends Component {
  componentWillMount() {
    this.getCompetitions()
  }

  getCompetitions() {
    const { dispatch } = this.props

    dispatch(loadCompetitions())
  }

  render() {
    const { competitions, remoteCall } = this.props

    return (
      <Home
        remoteCall={remoteCall}
        competitions={competitions}
      />
    )
  }
}

const mapStateToProps = (state) => {
  const { competitions } = state

  const competitionsRecords =
    competitions.get('ids').map(code => (
      competitions.getIn(['entities', code])
    ))

  return {
    competitions: competitionsRecords,
    remoteCall: competitions.get('remoteCall'),
  }
}

HomeContainer.propTypes = {
  competitions: PropTypes.instanceOf(Iterable).isRequired,
  remoteCall: PropTypes.instanceOf(Map).isRequired,
  dispatch: PropTypes.func.isRequired,
}

export default connect(mapStateToProps)(HomeContainer)
