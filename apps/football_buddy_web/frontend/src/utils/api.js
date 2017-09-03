import axios from 'axios'

const getCompetitions = () => (
  axios.get('/api/competitions')
)

const getCompetition = (code) => (
  axios.get(`/api/competitions/${code}`)
)

export default {
  getCompetitions,
  getCompetition,
}
