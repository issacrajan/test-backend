package com.issac.react.exception;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ValidationEx {
	private static final Logger logger = LoggerFactory.getLogger(ValidationEx.class);

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ErrorResp> handleValidationExceptions(MethodArgumentNotValidException ex) {
		Map<String, String> errors = new HashMap<>();
		ex.getBindingResult().getAllErrors().forEach((error) -> {
			String fieldName = ((FieldError) error).getField();
			String errorMessage = error.getDefaultMessage();
			errors.put(fieldName, errorMessage);
		});
		ErrorResp resp = new ErrorResp(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.name(),
				"invalid data");
		resp.setErrors(errors);
		return new ResponseEntity<>(resp, HttpStatus.BAD_REQUEST);
	}

	@ExceptionHandler(RecordNotFoundException.class)
	public ResponseEntity<ErrorResp> handleValidationExceptions(RecordNotFoundException ex) {

		ErrorResp resp = new ErrorResp(HttpStatus.NOT_FOUND.value(), HttpStatus.NOT_FOUND.name(),
				ex.getMessage());
		return new ResponseEntity<>(resp, HttpStatus.NOT_FOUND);
	}

	@ExceptionHandler(RecordAlreadyExists.class)
	public ResponseEntity<ErrorResp> handleValidationExceptions(RecordAlreadyExists ex) {

		ErrorResp resp = new ErrorResp(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.name(),
				ex.getMessage());
		return new ResponseEntity<>(resp, HttpStatus.BAD_REQUEST);
	}
	
	@ExceptionHandler(Exception.class)
	public ResponseEntity<ErrorResp> handleException(Exception ex) {
		logger.error("exception details ", ex);
		ErrorResp resp = new ErrorResp(HttpStatus.INTERNAL_SERVER_ERROR.value(),
				HttpStatus.INTERNAL_SERVER_ERROR.name(), ex.getMessage());
		return new ResponseEntity<>(resp, HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ExceptionHandler(RuntimeException.class)
	public ResponseEntity<ErrorResp> handleRunTimeException(RuntimeException ex) {
		logger.error("runtime exception details ", ex);
		ErrorResp resp = new ErrorResp(HttpStatus.INTERNAL_SERVER_ERROR.value(),
				HttpStatus.INTERNAL_SERVER_ERROR.name(), ex.getMessage());
		return new ResponseEntity<>(resp, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
