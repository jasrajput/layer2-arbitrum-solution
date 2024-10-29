import './App.css';
import Header from './components/header';
import Sidebar from './components/sidebar';
import Dashboard from './components/dashboard';
import Deposit from './pages/deposit';
import Root from './pages/root';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';

const router = createBrowserRouter([
  {
    path: '/',
    element: <Root />,
    children: [
      {
        index: true,
        element: <Dashboard />
      },
      {
        path: '/deposit',
        element: <Deposit />
      }
    ]
  },
  
  
])

function App() {
  return (
    <RouterProvider router={router} />
  );
}

export default App;
