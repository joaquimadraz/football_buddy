import React from 'react'
import PropTypes from 'prop-types'
import { Iterable } from 'immutable'
import { Container, Image, List } from 'semantic-ui-react'

const renderCompetition = competition => (
  <List.Item>
    <List.Icon>
      <span className="football-icon" />
    </List.Icon>
    <List.Content verticalAlign="middle">
      <List.Header as="a">{competition.name}</List.Header>
    </List.Content>
  </List.Item>
)

const CompetitionsList = ({ competitions }) => (
  <List selection>
    {competitions.map(renderCompetition)}
  </List>
)

CompetitionsList.propTypes = {
  competitions: PropTypes.instanceOf(Iterable).isRequired,
}

export default CompetitionsList
