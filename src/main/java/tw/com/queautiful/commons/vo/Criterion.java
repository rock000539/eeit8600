package tw.com.queautiful.commons.vo;

import tw.com.queautiful.commons.enums.QueryOpType;

public class Criterion {
	
	private String field;
	
	private Object value;
	
	private QueryOpType op;

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public QueryOpType getOp() {
		return op;
	}

	public void setOp(QueryOpType op) {
		this.op = op;
	}

	@Override
	public String toString() {
		return "Criterion [field=" + field + ", value=" + value + ", op=" + op + "]";
	}
	
}
