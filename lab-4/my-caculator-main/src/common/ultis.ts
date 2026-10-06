export function sum(a: number, b: number) {
  return a + b;
}

export function calculate(expression: string) {
  // B1: Chuẩn hóa các ký tự
  const normalized = expression
    .replace(/−/g, '-') // thay dấu trừ unicode
    .replace(/x/g, '*') // thay x thành nhân
    .replace(/÷/g, '/'); // nếu có chia kiểu ÷

  // B2: Kiểm tra chỉ chứa các ký tự hợp lệ
  if (!/^[0-9+\-*/.() ]+$/.test(normalized)) {
    return null;
  }

  // B3: Dùng Function để tính
  try {
    const result = new Function(`return ${normalized}`)();
    return result;
  } catch (e) {
    console.error('Lỗi khi tính toán:', e);
    return null;
  }
}
