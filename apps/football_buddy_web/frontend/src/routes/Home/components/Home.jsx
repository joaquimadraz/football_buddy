import React from 'react'
import PropTypes from 'prop-types'
import { Iterable } from 'immutable'
import { Header, Segment, Loader } from 'semantic-ui-react'

import CompetitionsList from './CompetitionsList'

const Home = ({ competitions, remoteCall }) => {
  return (
    <div>
      <Header as="h3">Select competition</Header>
      <Segment>
        <Loader active={remoteCall.get('loading')} />

        <CompetitionsList competitions={competitions} />
      </Segment>
    </div>
  )
}

Home.propTypes = {
  competitions: PropTypes.instanceOf(Iterable).isRequired,
}

export default Home
