import React from 'react'
import PropTypes from 'prop-types'
import { Iterable } from 'immutable'

const CompetitionsList = ({ competitions }) => (
  <div>
    Hey buddy! {competitions.size}
  </div>
)

CompetitionsList.propTypes = {
  competitions: PropTypes.instanceOf(Iterable).isRequired,
}

export default CompetitionsList
