export const fetchTodos = ()=> ($.ajax({
  method: 'GET',
  url: '/api/todos'
}))

// {fetchTodos} from 'this path'
