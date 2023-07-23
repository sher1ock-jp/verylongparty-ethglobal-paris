import { useEffect, useRef } from 'react';

interface SquareProps {
  squareId: number;
  coordinateX: number;
  coordinateY: number;
  initialFocusId: number;
}

const Square = ({ squareId, coordinateX, coordinateY, initialFocusId }: SquareProps) => {
  const squareRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (initialFocusId === squareId) {
      const squareElement = squareRef.current;
      if (squareElement) {
        squareElement.focus();
      }
    }
  }, [initialFocusId, squareId]);

  return (
    <div
      className="square"
      ref={squareRef}
      tabIndex={squareId === initialFocusId ? 0 : -1}
    >
      <span className="coordinates">{coordinateX},{coordinateY}</span>
    </div>
  );
};

export default Square;