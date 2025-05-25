import {
    BrowserRouter as Router,
    Routes,
    Route,
    Link,
} from 'react-router-dom'
import './css/App.css';
import Home from "./pages/Home";
import AboutUs from "./pages/AboutUs";
import ContactUs from "./pages/ContactUs";
import ChatgptUI from './pages/ChatgptUI';
import React, { useState, useEffect } from 'react';
import LoginModal from './components/LoginModal';
import styled, { keyframes } from 'styled-components';
import ProtectedRoute from './components/ProtectedRoute';

const Container = styled.div`
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  font-family: 'Press Start 2P', cursive;
  color: #ecf0f1;
  image-rendering: pixelated;
`;

const Nav = styled.nav`
  background: #34495e;
  padding: 15px;
  border-bottom: 4px solid #ecf0f1;
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

const NavLeft = styled.div`
  display: flex;
  justify-content: left;
`;

const NavCenter = styled.div`
  display: flex;
  justify-content: center;
`;

const NavRight = styled.div`
  display: flex;
  align-items: center;
`;

const NavLink = styled(Link)`
  color: #ecf0f1;
  text-decoration: none;
  margin: 0 15px;
  padding: 5px 10px;
  border: 2px solid transparent;

  &:hover {
    border-color: #e74c3c;
  }
`;

const pixelate = keyframes`
  0% { transform: translateY(0); }
  50% { transform: translateY(-5px); }
  100% { transform: translateY(0); }
`;

function App() {

  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [showLogin, setShowLogin] = useState(false);

  useEffect(() => {
    const storedAuth = localStorage.getItem('isAuthenticated');
    if (storedAuth === 'true') {
      setIsAuthenticated(true);
    }
  }, []);

  const handleLogin = () => {
    setIsAuthenticated(true);
    localStorage.setItem('isAuthenticated', 'true');
  };

  const handleLogout = () => {
    setIsAuthenticated(false);
    localStorage.removeItem('isAuthenticated');
  };

  return (
    <div className="App">
        <Router>
            <Container>
                <Nav>
                  <NavLeft>
                    <NavLink to="/">Home</NavLink>
                    <NavLink to="/aboutus">About Us</NavLink>
                    <NavLink to="/contactus">Contact Us</NavLink>
                  </NavLeft>
                  <NavCenter>
                    {isAuthenticated && <NavLink to="/chatgptui">Expenses</NavLink>}
                  </NavCenter>
                  <NavRight>
                    {!isAuthenticated ? (
                      <button onClick={() => setShowLogin(true)}>Login</button>
                    ) : (
                      <button onClick={handleLogout}>Logout</button>
                    )}
                  </NavRight>
                </Nav>

                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/aboutus" element={<AboutUs />} />
                  <Route path="/contactus" element={<ContactUs />} />
                  <Route
                    path="/chatgptui"
                    element={
                      <ProtectedRoute isAuthenticated={isAuthenticated}>
                        <ChatgptUI />
                      </ProtectedRoute>
                    }
                  />
                </Routes>
            </Container>
        </Router>
        <LoginModal
          show={showLogin}
          onClose={() => setShowLogin(false)}
          onLogin={handleLogin}
        />
    </div>
  );
}

export default App;
