import { connect } from 'react-redux'
import BenchIndex from './bench_index'
import { fetchBenches } from '../actions/bench_actions'

const mSTP = state => ({
  benches: state.entities.benches
})

const mDTP = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches())
})

export default connect(mSTP, mDTP)(BenchIndex)