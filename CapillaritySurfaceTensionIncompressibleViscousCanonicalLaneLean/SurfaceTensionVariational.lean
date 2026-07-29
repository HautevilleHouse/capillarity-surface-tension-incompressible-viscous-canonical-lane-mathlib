import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionVariationalPackage where
  freeEnergyFunctional : Type u
  interfacialArea : Type v
  surfaceTensionCoefficient : Type w
  youngLaplaceRelation : Prop
  variationalPrinciple : Prop

structure SurfaceTensionVariationalEvidence (S : SurfaceTensionVariationalPackage) where
  youngLaplaceRelationClosed : S.youngLaplaceRelation
  variationalPrincipleClosed : S.variationalPrinciple

def SurfaceTensionVariationalClosed (S : SurfaceTensionVariationalPackage) : Prop :=
  S.youngLaplaceRelation ∧ S.variationalPrinciple

theorem surface_tension_variational_closed_from_evidence
    (S : SurfaceTensionVariationalPackage) (E : SurfaceTensionVariationalEvidence S) :
    SurfaceTensionVariationalClosed S := by
  exact And.intro E.youngLaplaceRelationClosed E.variationalPrincipleClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse