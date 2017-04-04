package interface_service;

import java.util.HashMap;
import java.util.List;

public interface IDogKindService {
	
//	<insert id="insertDogkind" parameterType="java.util.HashMap">
//	insert into dog_kind values(#{kind}, #{dogSize}, 
//	#{adultWeight})
//</insert>	
//<update id="updateDogkind" parameterType="java.util.HashMap">
//	update dog_kind set dogSize=#{dogSize},
//	adultWeight=#{adultWeight} where kind=#{kind}
//</update>
//<delete id="deleteDogkind" parameterType="String">
//	delete from dog_kind where kind=#{kind}
//</delete>
//<select id="selectOneDogkind" parameterType="String" resultType="java.util.HashMap">
//	select * from dog_kind where kind=#{kind}
//</select>
//<select id="selectAllDogkind" resultType="java.util.HashMap">
//	select * from dog_kind
//</select>
	public boolean writeDogKind(String kind, String dogSize, double adultWeight);
	public boolean updateDogKind(String kind, String dogSize, double adultWeight);
	public boolean deleteDogKind(String kind);
	public HashMap<String, Object> selectOneDogKind(String kind);
	public List<HashMap<String, Object>> selectAllDogKind();
}
