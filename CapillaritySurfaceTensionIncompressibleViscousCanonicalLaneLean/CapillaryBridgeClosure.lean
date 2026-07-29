import canonicalLaneMathlib.AdmissibleClass
import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillaryAdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse