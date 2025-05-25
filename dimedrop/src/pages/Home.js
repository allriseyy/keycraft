import React, { useEffect, useState } from 'react';
import '../css/Home.css'; // Optional if you want to separate styles

const Home = () => {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const timer = setTimeout(() => setVisible(true), 100);
    return () => clearTimeout(timer);
  }, []);

  return (
    <div className={`home-container ${visible ? 'fade-in' : ''}`}>
      <h1 className="home-title">Welcome to DimeDrop</h1>

      <p className="home-description">
        Track your spending. Defeat your demons. Level up your life.
        <br />
        DimeDrop turns boring budgeting into an epic adventure.
        <br />
        Log your expenses, battle enemies spawned by bad spending habits, and level up as you stay financially fit. 
        Whether you're saving for something big or just want to be more mindful with your money,
        <br />
        DimeDrop makes it fun to take control.
      </p>
    </div>
  );
};

export default Home;
