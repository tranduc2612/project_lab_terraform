import { render, screen, fireEvent, act } from '@testing-library/react';
import App from './App';
import * as utils from './common/ultis';

describe('App Calculator', () => {
  const sequenceNumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    '-',
    '+',
    'x',
    '/',
  ];

  /** Helper: Click toàn bộ dãy phím theo thứ tự */
  const clickSequence = (sequence: string[]) => {
    sequence.forEach((num) => {
      const btn = screen.getByText(
        (content) => content.replace(/−/g, '-').trim() === num,
        { selector: '.button' },
      );
      fireEvent.mouseUp(btn);
    });
  };

  /** Helper: Lấy phần tử hiển thị phép tính */
  const getDisplay = (text: string) =>
    screen.getByText(text, { selector: '.calc-operation .calc-display' });

  /** Helper: Lấy nút C */
  const getButtonC = () => screen.getByText('C', { selector: '.button.c' });

  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.clearAllTimers();
  });

  it('Hiển thị giá trị mặc định ban đầu', () => {
    render(<App />);
    expect(getDisplay('0')).toBeInTheDocument();
    expect(
      screen.getByText('0', { selector: '.calc-typed' }),
    ).toBeInTheDocument();
  });

  it('Nhấn số sẽ cập nhật input', () => {
    render(<App />);
    clickSequence(sequenceNumber);

    expect(getDisplay(sequenceNumber.join(''))).toBeInTheDocument();
  });

  it('Nhấn C 1 lần sẽ xóa 1 ký tự cuối', () => {
    render(<App />);
    clickSequence(sequenceNumber);

    const btnC = getButtonC();
    fireEvent.mouseDown(btnC);
    fireEvent.mouseUp(btnC);

    expect(
      getDisplay(sequenceNumber.join('').slice(0, -1)),
    ).toBeInTheDocument();
  });

  it('Giữ phím C lâu sẽ reset về 0', async () => {
    render(<App />);
    clickSequence(sequenceNumber);

    const btnC = getButtonC();

    fireEvent.mouseDown(btnC);
    await act(async () => {
      vi.advanceTimersByTime(600); // Giữ phím 600ms
    });
    fireEvent.mouseUp(btnC);

    await act(async () => {
      vi.runAllTimers();
    });

    expect(getDisplay('0')).toBeInTheDocument();
  });

  it('Nhấn = sẽ tính kết quả bằng hàm calculate', () => {
    const spy = vi.spyOn(utils, 'calculate').mockReturnValue('42');
    render(<App />);

    const btnEqual = screen.getByText('=');
    fireEvent.mouseUp(btnEqual);

    expect(spy).toHaveBeenCalled();
    expect(screen.getByText('42')).toBeInTheDocument();

    spy.mockRestore();
  });
});
