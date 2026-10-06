import { useEffect, useRef, useState } from 'react';
import './App.css';
import { KEY_BOARD, KEYBOARD_TYPE, MAX_LENGTH_INPUT } from './common/constant';
import { calculate } from './common/ultis';

function App() {
  const [input, setInput] = useState<string>('0');
  const [result, setResult] = useState<string>('0');
  const intervalRef = useRef<any>(null);
  const [serverInfo, setServerInfo] = useState<{ hostname: string } | null>(null);

  const getServerInfo = async () => {
    const response = await fetch(`/server-info.json?t=${Date.now()}`);
    const data = await response.json();

    setServerInfo(data);
  };

  useEffect(() => {
    getServerInfo();
  }, []);

  const renderClassBtn = (keyType: string) => {
    switch (keyType) {
      case KEYBOARD_TYPE.COMPUTE:
        return 'l';
      case KEYBOARD_TYPE.CONTROL:
        return 'c';
      default:
        return '';
    }
  };

  const handleMouseUp = (value: string, key: string) => {
    let resultInput = input;
    if (key === 'C') {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
      return;
    }
    if (key === '=') {
      const result = calculate(input);
      if (!result) {
        window.alert('Biểu thức không hợp lệ');
        return;
      }
      setResult(result);
      return;
    }
    if (input.length >= MAX_LENGTH_INPUT) return;
    if (resultInput === '0') {
      resultInput = '';
    }
    resultInput += value;
    setInput(resultInput);
  };

  const handleMouseDown = (_value: string, key: string) => {
    if (key !== 'C') return;
    let resultInput = input;
    if (resultInput.length === 1) {
      resultInput = '0';
      setResult('0');
    } else {
      resultInput = resultInput.slice(0, -1);
    }
    setInput(resultInput);

    intervalRef.current = setInterval(() => {
      setResult('0');
      setInput('0');
    }, 500);
  };

  return (
    <>

      <button onClick={getServerInfo}>
        Test ALB
      </button>

      {serverInfo && (
        <div>
          <h2>Current ECS Task</h2>

          <p>
            Hostname: <strong>{serverInfo.hostname}</strong>
          </p>
        </div>
      )}

      <div className="container">
        <div className="calc-body">
          <div className="calc-screen">
            <div className="calc-operation">
              <span className="calc-display">{input}</span>
              <span className="blink-me">_</span>
            </div>
            <div className="calc-typed">{result}</div>
          </div>
          {KEY_BOARD.map((row, rowIndex) => (
            <div className="calc-button-row" key={rowIndex}>
              {row.map((key) => (
                <div
                  className={`button ${renderClassBtn(key.keyType)}`}
                  key={key.key}
                  onMouseDown={() => handleMouseDown(key.value, key.key)}
                  onMouseUp={() => handleMouseUp(key.value, key.key)}
                >
                  {key.value}
                </div>
              ))}
            </div>
          ))}
        </div>
      </div>
    </>
  );
}

export default App;
