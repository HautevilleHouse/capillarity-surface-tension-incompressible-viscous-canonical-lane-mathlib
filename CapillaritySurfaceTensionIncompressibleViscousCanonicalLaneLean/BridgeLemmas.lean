import canonicalLaneMathlib.AdmissibleClass
import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CapillarityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
