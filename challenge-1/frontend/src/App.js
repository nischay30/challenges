import logo from './logo.svg';
import './App.css';
import Visitor from './Visitor.js';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
          <Visitor />
      </header>
    </div>
  );
}

export default App;
