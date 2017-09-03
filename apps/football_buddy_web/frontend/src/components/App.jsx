import React from 'react'
import { Container, Header } from 'semantic-ui-react'

const App = ({ children }) => (
  <Container>
    <br />
    <Header as="h1">Football Buddy</Header>
    {children}
  </Container>
)

export default App
