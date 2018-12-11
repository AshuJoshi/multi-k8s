import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
    return (
        <div>
            I'm Some Other Page
            <Link to="/">Go Back Home</Link>
        </div>
    );
};