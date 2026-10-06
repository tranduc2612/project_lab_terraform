import { describe, it, expect } from 'vitest';
import { sum, calculate } from '../ultis'; // đường dẫn tuỳ theo vị trí file của bạn

describe('sum()', () => {
  it('cộng hai số dương', () => {
    expect(sum(2, 3)).toBe(5);
  });

  it('cộng số âm và dương', () => {
    expect(sum(-2, 5)).toBe(3);
  });

  it('cộng hai số âm', () => {
    expect(sum(-4, -6)).toBe(-10);
  });
});

describe('calculate()', () => {
  it('tính biểu thức đơn giản', () => {
    expect(calculate('2+3')).toBe(5);
  });

  it('hỗ trợ dấu nhân và chia', () => {
    expect(calculate('6/2')).toBe(3);
    expect(calculate('4x3')).toBe(12);
  });

  it('hỗ trợ dấu trừ unicode −', () => {
    expect(calculate('10−3')).toBe(7);
  });

  it('tính biểu thức phức tạp có ngoặc', () => {
    expect(calculate('(2+3)*4')).toBe(20);
  });

  it('trả về null nếu có ký tự không hợp lệ', () => {
    expect(calculate('2+abc')).toBeNull();
    expect(calculate('2+3$')).toBeNull();
  });

  it('xử lý lỗi syntax trả về null', () => {
    expect(calculate('2++3')).toBeNull();
  });
});
