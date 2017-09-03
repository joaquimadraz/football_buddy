import React from 'react'
import PropTypes from 'prop-types'
import { Iterable } from 'immutable'
import CompetitionsList from './CompetitionsList'

const Home = ({ competitions, remoteCall }) => {
  return (
    <div>
      <CompetitionsList competitions={competitions} />
    </div>
  )
}

Home.propTypes = {
  competitions: PropTypes.instanceOf(Iterable).isRequired,
}

export default Home
