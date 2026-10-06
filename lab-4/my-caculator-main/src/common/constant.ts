const MAX_LENGTH_INPUT = 79;

const KEYBOARD_TYPE = {
  CONTROL: 'CONTROL',
  COMPUTE: 'COMPUTE',
  NUMBER: 'NUMBER',
};

const KEY_BOARD = [
  [
    { key: 'C', value: 'C', keyType: KEYBOARD_TYPE.CONTROL },
    { key: '≠', value: '≠', keyType: KEYBOARD_TYPE.COMPUTE },
    { key: '%', value: '%', keyType: KEYBOARD_TYPE.COMPUTE },
    { key: '/', value: '/', keyType: KEYBOARD_TYPE.COMPUTE },
  ],
  [
    { key: '7', value: '7', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '8', value: '8', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '9', value: '9', keyType: KEYBOARD_TYPE.NUMBER },
    { key: 'x', value: 'x', keyType: KEYBOARD_TYPE.COMPUTE },
  ],
  [
    { key: '4', value: '4', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '5', value: '5', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '6', value: '6', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '-', value: '-', keyType: KEYBOARD_TYPE.COMPUTE },
  ],
  [
    { key: '1', value: '1', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '2', value: '2', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '3', value: '3', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '+', value: '+', keyType: KEYBOARD_TYPE.COMPUTE },
  ],
  [
    { key: 'D', value: 'D', keyType: KEYBOARD_TYPE.CONTROL },
    { key: '0', value: '0', keyType: KEYBOARD_TYPE.NUMBER },
    { key: '.', value: '.', keyType: KEYBOARD_TYPE.CONTROL },
    { key: '=', value: '=', keyType: KEYBOARD_TYPE.CONTROL },
  ],
];

export { KEY_BOARD, KEYBOARD_TYPE, MAX_LENGTH_INPUT };
