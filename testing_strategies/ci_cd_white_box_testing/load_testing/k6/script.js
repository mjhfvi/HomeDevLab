import http from 'k6/http';
import { check, sleep } from 'k6';

// Test configuration
export const options = {
  vus: 10, // Simulate 10 virtual users
  duration: '30s', // For a total duration of 30 seconds
  thresholds: {
    // Assert that 99% of requests finish within 3000ms.
    http_req_duration: ['p(99) < 3000'],
    // Assert that 99% of requests succeed.
    'checks': ['rate>0.99'],
  },
};

// Simulated user behavior
export default function () {
  const res = http.get('http://localhost:8080'); // Make an HTTP GET request

  // Validate the response status
  check(res, {
    'status was 200': (r) => r.status === 200,
  });

  sleep(1); // Wait for 1 second between iterations for each VU
}


// docker run -p 8080:8080 -it ghcr.io/octopusappdev/octopus.api.core:0ad372b /bin/bash
// k6 run script.js